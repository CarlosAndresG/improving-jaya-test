# My Improving Jaya Test

Because special features (jsonb attributes) this installation requires postgres.  I used ngrok for forwarding.

The versions that you need to run this test:

* Ruby 3.0.1

* Rails 6.1.4.4


## Step by Step - Run application

* bundle install

* rails db:create && rails db:migrate

* Create a .env file in the root folder

```
POSTGRES_USER=xxxxxx
POSTGRES_PASSWORD=xxxxxx
RAILS_MAX_THREADS=24
RAILS_MIN_THREADS=12
POSTGRES_PORT=xxxx
POSTGRES_HOST=xxx.xxx.xxx.xxx
NGROK_HOST=xxxxx.ngrok.io
```

* Generate the secret in terminal:
```
ruby -rsecurerandom -e 'puts SecureRandom.hex(20)'
```

* and add it to your client credentials with your favourite editor (Vscode in my case). (This secret must be provided in the webhook configuration)
```
EDITOR='code --wait' rails credentials:edit

github:
  secret_access_key: XXXXXXXXXXXXXXXXXXXXXXXX
```


## Run rails server

bundle exec rails server 

## Run ngrok

ngrok http 3000

## Run tests

rspec