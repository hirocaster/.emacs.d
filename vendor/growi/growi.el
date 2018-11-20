;;; growi.el --- Emacs client for growi.

;; Copyright (C) 2018 Hiroki Ohtsuka

;; Author: Hiroki Ohtsuk <hohtsuka@gmail.com>
;; Version: 0.1.0
;; Package-Requires: ((emacs "24") (markdown-mode "2.4"))
;; Keywords: Markdown, growi
;; URL: https://github.com/hirocaster/emacs-growi

;;; Commentary:

;; This package assists the user in managing growi markdown.
;; Please see README.md for documentation.

;;; Code:
(require 'json)
(require 'url-util)
(require 'markdown-mode)

(defgroup growi nil
  "Elisp client for Growi."
  :group 'tools
  :prefix "growi-")

;;; Constant
(defconst growi-version "0.1.0")
(defconst growi-api-endpoint "/_api")

;;; Customizable variables
(defcustom growi-uri "http://localhost:3000"
  "Growi URI."
  :type 'string)
(defcustom growi-access-token ""
  "Growi Access Token."
  :type 'string)
(defcustom growi-user (getenv "USER")
  "Growi USER."
  :type 'string)
(defcustom growi-curl "curl"
  "Executable for curl command."
  :type 'string)
(defcustom growi-curl-options nil
  "Curl command additional options.  Separate each option with a space."
  :type 'string)
(defcustom growi-markdown-save nil
  "Whether to save the Get Markdown in file."
  :type 'boolean)
(defcustom growi-markdown-save-path "~/wiki"
  "Save path for Markdown in file."
  :type 'string)
(defcustom growi-attachment-save-path "~/wiki"
  "Save path for attachment file."
  :type 'string)

;;; Utility
(defun growi-write-to-tmp-file (target-path data)
  "Write file to TARGET-PATH from DATA."
  (let ((res (ignore-errors
			   (with-temp-file target-path (insert data) target-path)
			   t)))
	(unless res
	  (error-message-string "failed growi-write-to-tmp-file"))
	res))

(defun growi-create-buffer ()
  "Create a buffer to display the result."
  (interactive)
  (kill-buffer (get-buffer-create "*Growi*"))
  (switch-to-buffer (get-buffer-create "*Growi*")))

(defun growi-mkdir-parent (path)
  "Make parent directory as PATH."
  (let* ((fullpath "")
    (res (ignore-errors
    (mapc (lambda (i)
    		(unless (file-directory-p fullpath)
    		  (make-directory fullpath))
    		(setq fullpath (concat fullpath "/" i)))
    	  (split-string (expand-file-name path) "/"))
    t)))
	(unless res
	  (error-message-string "failed growi-mkdir-parent"))
	res))

(defun growi-candidate (args)
  "Return list for candidate.  ARGS as What to create candidate."
  (delete-dups (mapcar (lambda (i)
						 (cond
						  ((equal args "page")
						   (assoc-default 'path i))
						  ((equal args "path")
						   (file-name-directory (assoc-default 'path i)))
						  ((equal args "basename")
						   (file-name-nondirectory (assoc-default 'path i)))
						  (t
						   (assoc-default 'path i))))
					   (elt (assoc-default 'pages (growi-api "GET" "/pages.list")) 1))))

(defun growi-pageid (path)
  "Return Growi pageid.  PATH as Growi path."
  (assoc-default
   'id (assoc 'page (growi-api "GET" "/pages.get" (concat "&path=" (url-hexify-string path))))))

(defun growi-curl-download (uri filename)
  "Download by curl from URI.  Save as FILENAME."
  (with-temp-buffer
	(let* ((fname (expand-file-name filename))
		   (opt  `("-Ss" "--fail" "--create-dirs" "--output" ,fname ,uri))
		   (opt (if growi-curl-options
					(append opt (split-string growi-curl-options " ")) opt))
		   (ret (apply #'call-process growi-curl nil (current-buffer) nil opt)))
	  (unless (zerop ret)
		(error (message "[Curl ERROR] %s"
				 (buffer-substring-no-properties (point-min) (point-max)))))
	  ret)))

;;; API access function
(defun growi-api (method api &optional parm alist)
  "Access Growi api.  METHOD is GET or PUT.  Growi api path as API.
query strings as PARM.  alist for json as ALIST."
  (with-temp-buffer
	(let* ((uri (concat growi-uri growi-api-endpoint api
						"?access_token=" (url-hexify-string growi-access-token)
						"&user=" growi-user
						parm))
		   (json (json-encode-alist alist))
		   (growi-tmp-file (make-temp-file "growi" nil ".temp"))
		   (ret (growi-write-to-tmp-file growi-tmp-file json))
		   (opt  `("-X" ,method
				   "-H" "Content-type: application/json"
				   "-Ss"
				   "--fail"
				   "--data-binary" ,(concat "@" growi-tmp-file)
				   ,uri))
		   (opt (if growi-curl-options
					(append opt (split-string growi-curl-options " ")) opt))
		   (ret (apply #'call-process growi-curl nil (current-buffer) nil opt))
		   res body)
	  (goto-char (point-min))
	  (unless (zerop ret)
		(error (format "[Curl ERROR] %s"
				 (buffer-substring-no-properties (point-min) (point-max)))))
	  (setq body (replace-regexp-in-string
				  "\n+$" ""
				  (buffer-substring-no-properties (point-min) (point-max))))
	  (unless (eq 0 (length body))
		(setq res (json-read-from-string body))
		(unless (eq t (assoc-default 'ok res))
		  (error (format "[Growi] %s" (assoc-default 'error res))))
	  res))))

(defun growi-api-attachments.add (page-id file-path)
  "Access Growi api for attachments.   Growi page_id as PAGE-ID.
Attachment file path as FILE-PATH."
  (with-temp-buffer
	(let* ((uri (concat growi-uri growi-api-endpoint "/attachments.add"
						"?access_token=" (url-hexify-string growi-access-token)
						"&user=" growi-user))
		   (pageid (concat "page_id=" page-id))
		   (file (concat "file=@" file-path))
		   (opt  `("-X" "POST"
				   "-Ss"
				   "--fail"
				   "--form" ,pageid
				   "--form" ,file
				   ,uri))
		   (opt (if growi-curl-options
					(append opt (split-string growi-curl-options " ")) opt))
		   (ret (apply #'call-process growi-curl nil (current-buffer) nil opt))
		   res body)
	  (goto-char (point-min))
	  (unless (zerop ret)
		(error (format "[Curl ERROR] %s"
				 (buffer-substring-no-properties (point-min) (point-max)))))
	  (setq body (replace-regexp-in-string
				  "\n+$" ""
				  (buffer-substring-no-properties (point-min) (point-max))))
	  (unless (eq 0 (length body))
		(setq res (json-read-from-string body))
		(unless (eq t (assoc-default 'ok res))
		  (error (format "[Growi] %s" (assoc-default 'error res))))
	  res))))

;;; interactive
;; users
;;;###autoload
(defun growi-users-list ()
  "Output Growi users list in buffer."
  (interactive)
  (growi-create-buffer)
  (insert
   (mapconcat 'identity
			  (mapcar (lambda (i) (concat (assoc-default 'name i ) ":"
										  (assoc-default 'username i ) ":"
										  (assoc-default 'email i )))
					  (assoc-default 'users (growi-api "GET" "/users.list")))
			  "\n" )))

;; pages
;;;###autoload
(defun growi-pages-list ()
  "Output Growi pages list in buffer."
  (interactive)
  (growi-create-buffer)
  (insert
   (mapconcat 'identity
			  (mapcar (lambda (i)
						(assoc-default 'path i))
					  (elt (assoc-default 'pages (growi-api "GET" "/pages.list")) 1))
			  "\n")))

;;;###autoload
(defun growi-pages-get ()
  "Output Growi page."
  (interactive)
  (growi-create-buffer)
  (let ((path (completing-read "Growi page ? "
									  (growi-candidate "page"))))
	(insert (assoc-default
			 'body (assoc 'revision
                          (assoc 'page
						    	 (growi-api
						    	  "GET" "/pages.get" (concat "&path=" (url-hexify-string path)))))))
	(goto-char (point-min))
	(markdown-mode)
	(when growi-markdown-save
	  (let ((save-path (completing-read "Download path ? "
										(list growi-markdown-save-path) nil
										'confirm-after-completion)))

        (when (eq 0 (length save-path))
          (setq save-path growi-markdown-save-path))

         (growi-mkdir-parent
		  (concat save-path path))

		(write-file
         (concat save-path path ".md"))

        ))))

(defun growi-pages-update (body)
  "Update Growi page.  BODY as Growi page for update."
  (let* ((path (completing-read "Growi update page ? "
										(growi-candidate "page")))
		 (args `( ("page_id" . ,(growi-pageid path))("body" . ,body))))
	(assoc-default 'path
				   (assoc 'page (growi-api "POST" "/pages.update" nil args)))))
;;;###autoload
(defun growi-pages-update-from-buffer ()
  "Update Growi page from buffer contents."
  (interactive)
  (message "%s is update from buffer"
		   (growi-pages-update
			(buffer-substring-no-properties (point-min) (point-max)))))

;;;###autoload
(defun growi-pages-update-from-file ()
  "Update Growi page from file."
  (interactive)
  (let ((file-name (read-file-name "Markdown file for update?" nil nil t)))
  (message "%s is update from file"
		   (growi-pages-update (with-temp-buffer
								 (insert-file-contents file-name)
								 (buffer-substring-no-properties
								  (point-min) (point-max)))))))

(defun growi-pages-create (body)
  "Create Growi page.  BODY as Growi page for create."
  (let* ((path
		  (completing-read "Growi parent path for create ? "
						   (cons (concat "/user/" growi-user "/memo/"
										 (format-time-string "%Y/%m/%d/"
															 (current-time)))
								 (growi-candidate "path"))
						   nil 'confirm-after-completion))
		 (path (if (equal (substring path -1) "/") path (concat path "/")))
		 (basename
		  (completing-read "Growi page name for create? "
									(if (buffer-file-name)
										(cons
										 (file-name-base (buffer-file-name))
											  (growi-candidate "basename"))
									  (growi-candidate "basename"))
									nil 'confirm-after-completion ))
		 (path (concat path basename))
		 (args `( ("path" . ,path)("body" . ,body))))
	(assoc-default 'path
				   (assoc 'page (growi-api "POST" "/pages.create" nil args)))))
;;;###autoload
(defun growi-pages-create-from-buffer ()
  "Create Growi page from buffer."
  (interactive)
  (message "%s is create from buffer"
		   (growi-pages-create
			(buffer-substring-no-properties (point-min) (point-max)))))

;;;###autoload
(defun growi-pages-create-from-file ()
  "Create Growi page from file."
  (interactive)
  (let ((file-name (read-file-name "Markdown file for create?" nil nil t)))
  (message "%s is create from file"
  (growi-pages-create (with-temp-buffer
					 (insert-file-contents file-name)
					 (buffer-substring-no-properties
					  (point-min) (point-max)))))))

;; comments
;;;###autoload
(defun growi-comments-get ()
  "Get Growi page comments in buffer."
  (interactive)
  (growi-create-buffer)
  (let* ((path (completing-read "Growi page for get comments? "
									  (growi-candidate "page")))
		 (data (growi-api "GET" "/comments.get"
						  (concat "&page_id=" (growi-pageid path)))))
	(when (eq 0 (length (assoc-default 'comments data)))
	  (error (format "No comments on %s" path)))
	(insert
	 (mapconcat 'identity
				(mapcar (lambda (i)
						  (assoc-default 'comment i ))
						(assoc-default 'comments data)) "\n"))
	(goto-char (point-min))))

;;;###autoload
(defun growi-comments-add-from-buffer ()
  "Add Growi comment from buffer contents."
  (interactive)
  (let* ((path (completing-read "What is Growi page to comment on? "
									  (growi-candidate "page")))
		 (data (growi-api "GET" "/pages.get" (concat "&path=" path)))
		 (pageid (assoc-default 'id (assoc 'page data)))
		 (revisionid (assoc-default '_id (assoc-default
										  'revision (assoc 'page data))))
		 (comment (buffer-substring-no-properties (point-min) (point-max)))
		 (args `(("commentForm" . (("page_id" . ,pageid)("comment" . ,comment)
								   ("revision_id" . ,revisionid))))))
	(growi-api "POST" "/comments.add" nil args)
	(message "for %s comment is added" path)))

;; attachments
;;;###autoload
(defun growi-attachments-download ()
  "Download Growi attachments."
  (interactive)
  (let* ((path (completing-read "Growi page for download attachments? "
									  (growi-candidate "page")))
		 (data (growi-api "GET" "/attachments.list"
						  (concat "&page_id=" (growi-pageid path)))))
	(when (eq 0 (length (assoc-default 'attachments data)))
	  (error (format "No attachments on %s" path)))
	(let* ((save-path (completing-read "Download path ? "
									   (list growi-attachment-save-path) nil
									   'confirm-after-completion)))
	  (when (eq 0 (length save-path)
				(setq save-path growi-markdown-save-path)))
	  (mapc (lambda (i)
			  (growi-curl-download
			   (concat growi-uri (assoc-default 'url i))
			   (concat save-path path "_" (assoc-default 'originalName i))))
			(assoc-default 'attachments data))
	  (message "%s attachments has been downloaded." path))))

(defun growi-attachments-add ()
  "Add Growi attachment from file."
  (interactive)
  (let* ((path (completing-read "Growi attachment page ? "
									  (growi-candidate "page")))
		 (file-name (read-file-name "attachment file?" nil nil t)))
	(growi-api-attachments.add (growi-pageid path) file-name)
	(message "%s" (concat file-name " attached to" path))))

(defun growi-attachments-remove ()
  "Remove Growi attachments."
  (interactive)
  (let* ((path (completing-read "Growi page for remove attachments? "
									  (growi-candidate "page")))
		 (data (growi-api "GET" "/attachments.list"
						  (concat "&page_id=" (growi-pageid path)))))
	(when (eq 0 (length (assoc-default 'attachments data)))
	  (error (format "No attachments on %s" path)))
	(let* ((file (completing-read "remove file ? "
	  (mapcar (lambda (i)
			   (assoc-default 'originalName i))
			  (assoc-default 'attachments data)) nil )))
	  (mapc (lambda (i)
			   (if (equal file (assoc-default 'originalName i))
				   (growi-api "POST" "/attachments.remove" nil
				   `(("attachment_id" . ,(assoc-default '_id i))))))
			  (assoc-default 'attachments data))
	  (message "attachment %s  has been removed." file))))


(provide 'growi)

;;; growi.el ends here
