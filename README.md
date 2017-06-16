# Nekogirls-cr

Nekogirls-cr is a pomf-like website built in Crystal and Kemal, it lets users upload files from a webpage or (it is built for) using programs such as ShareX.

## Installation

From the Repo
1. Clone the Repo `git clone https://github.com/cyan101/nekogirls-cr.git`
2. `cd nekogirls-cr`
3. Delete the .git folder `rm -rf .git` and start your own repo `git init`
4. Install all the required shards `shards`

From the compiled release

* TODO

Using Nginx for file serving/ssl (Example)
```
server {
        listen 80;
        expires 30d;
        client_max_body_size 20m;
        server_name nekogirls.moe;
        root /root/nekogirls-rb/public;
        access_log /var/log/nginx/nekogirls-rb-access.log;
        error_log /var/log/nginx/nekogirls-rb-error.log;
        location /pictures/ {
                try_files $uri $uri/ =404;
        }
        location /css/ {
                try_files $uri $uri/ =404;
        }
        location /js/ {
                try_files $uri $uri/ =404;
        }
        location / {
                proxy_pass http://localhost:8080;
        }
}
```
1. This uses Nginx to serve pictures/css/js and then passes anything else onto nekogirls-cr
2. `client_max_body_size 20m;` limits the filesize to 20mb for uploads
2. (Optional) Setup SSL/HTTPS using [this guide](https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-14-04)

## Usage

From the Repo
1. Run `crystal src/nekogirls.cr`, alternatively use a proccess manager like [PM2](http://pm2.keymetrics.io/) to run it in the background

Uploading with ShareX (Example)
1. Open ShareX and go to uploaders -> custom uploaders -> import -> from clipboard
2. Copy/Paste the following code
```
{
  "Name": "nekogirls.moe",
  "RequestType": "POST",
  "RequestURL": "https://nekogirls.moe/upload",
  "FileFormName": "file_to_upload",
  "Arguments": {
    "code": "SpecialCodeGoesHere"
  },
  "ResponseType": "RedirectionURL"
}
```
3. Set the upload types at the bottom

## Development List

* Add code comments
* Add "secret" code to limit who can upload

## Contributing

1. Fork it ( https://github.com/cyan101/nekogirls-cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Cyan101](https://github.com/cyan101) Jos Spencer - creator, maintainer
