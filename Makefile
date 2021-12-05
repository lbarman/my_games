upload:
		rsync -avzP --delete-before  --exclude ".git" --exclude "docker-compose.yml" --exclude ".gitignore" --exclude ".gitattributes" --exclude "tests" . vps:vps/partygames/data
