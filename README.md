# Ponbot

## Setting up
- Create .env file in the project route folder.
- For dev setup, add the following content to .env file.
```
export DEV_DB_USERNAME=<your db username>
export DEV_DB_PASSWORD=<your db password>
export DEV_DB=<your db>
export DEV_LINE_CHANNEL_ID=<your line channel id>
export DEV_LINE_CHANNEL_SECRET=<your line channel secret>
```
- `source .env`
- `mix phx.server`
