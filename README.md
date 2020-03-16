# README


## Passos para rodar projeto

In the project directory, you can run:

### `yarn start`

Create File master.key.<br />

### `config/master.key`

Add following content<br />

### `4f25dd1ad4680009943cd6bad7264e27`

Runs command in terminal.<br />
### `bin/rails credentials:edit`

check and modify content according to your database access data as well as the access token<br />
the file will look like this:<br />


secret_key_base: 036b8a8ccaab883a48195540a958ced87414dcdfc404a3a7b6934871356d7056d4d3d8ba11bb9c9cc715e49531810deb1d538e1f66eea844aae6184b6f2ffc59

orulo:
  authorization: Bearer a8vZ5ZYVb9c4TyaPwhKTfx8ilehxmPG6lp86KASiHgU

postgres:
  username: arlymoura
  password: asm123456


Runs command in terminal.<br />
_________________________________________

### `rake db:drop db:create db:migrate db:seed db:update `

To create the development and test bank Two previously created Users: <br />
email: user@user.com
password: 12345678

email: user2@user.com
password: 12345678
<br />


Runs command in terminal.<br />
_________________________________________

### `foreman start -f Procfile.dev-server`


Starts the server. <br />
Access the url [server running] (https: // localhost: 3000) to view!

Runs command in terminal.<br />
_________________________________________

### `rake test`

Run battery testing and verification of codes and privacy flaws.<br />

