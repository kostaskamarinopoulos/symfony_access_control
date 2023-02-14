## APIs
- All users('GET'): `/user`
- Create('POST'): `/user/new`
- Show('GET'): `/user/{id}`
- Edit('POST'): `/user/{id}/edit`
- Delete('POST'): `/user/{id}`

- All groups('GET'): `/interest/group`
- Create('POST'): `/interest/group/new`
- Show('GET'): `/interest/group/{id}`
- Edit('POST'): `/interest/group/{id}/edit`
- Delete('POST'): `/interest/group/{id}`

## Data
`dummy_data.sql` can be imported in your database
admin user: 
name: boss, password: 123456

normal user(not admin): 
name: test, password: 123456

# Setup
- cp .env.example .env
- composer install
- symfony server:start -d

## DB Model
![My Image](DB_MODEL.png?raw=true)

## UML
![My Image](UML.png?raw=true)

Ideally a Roles table should have been created as well.

## TODO
- Show proper error message when trying to delete a user that is assigned to a group. Currently is throwing an exception.
- Add dunctionality to assign users to groups in the UI. Once this is done the commented lines (66-69) in `UserController` should be uncommented.
