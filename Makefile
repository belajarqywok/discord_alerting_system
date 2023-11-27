create_bucket:
	gsutil mb -p petdoc-capstone-project -l asia-southeast2 gs://alerting-service-bucket

create_function_manual:
	gcloud functions deploy discord-alerting \
    	--region=asia-southeast2 \
    	--runtime=go120 \
    	--source=. \
    	--entry-point=DiscordAlerting \
    	--trigger-topic=ml-service-topic \
		--memory=512MB \
		--timeout=60s \
		--min-instances=0 \
		--max-instances=3 \
		--env-vars-file=configurations/envars.yaml

deploy:
	terraform init
	terraform apply -auto-approve -var="discord_id=$(discord_id)" -var="discord_token=$(discord_token)"
