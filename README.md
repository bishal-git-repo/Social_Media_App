# README

This README will document the steps necessary to get the application up and running.

## Ruby Version

- Ruby 3.3.6 (2024-11-05 revision 75015d4c1f) [x64-mingw-ucrt]

## Steps to Set Up and Run the Project Locally

1. **Download the Ruby Installer** for the version mentioned above (Ruby 3.3.6).
   - You can download it from [the official Ruby website](https://www.ruby-lang.org/en/documentation/installation/).
   
2. **Clone the Project** from GitHub.
   - Use the following command to clone the repository:
     ```bash
     git clone <your-github-repo-url>
     ```
   
3. **Set Up Database Credentials**:
   - Open the `config/database.yml` file and configure your database credentials (username, password, etc.) for your development and test environments.

4. **Migrate the Database**:
   - Run the following commands to set up your database schema:
     ```bash
     rails db:create
     rails db:migrate
     ```

5. **Run the Application**:
   - Start the Rails server with the following command:
     ```bash
     rails server
     ```
   - The application will be running at `http://localhost:3000`.

6. **Test the Endpoints Using Postman**:

   ### Authentication and User Endpoints:
   
   - **POST /signup**
     - Payload:
       ```json
       {
         "user": {
           "email": "example@email.com",
           "password": "123456",
           "role": "user"
           "name": "username",
         }
       }
       ```
     - This endpoint creates a new user.
   
   - **POST /login**
     - Payload:
       ```json
       {
         "email": "example@email.com",
         "password": "123456"
       }
       ```
     - This endpoint logs in a user and returns a JWT token.

   - **POST /logout**
     - No payload is required.
     - This endpoint logs out the user by invalidating their token.

   ### Posts Endpoints:
   
   - **GET /posts**
     - Fetches all posts.

   - **GET /posts/:id**
     - Replace `:id` with the post ID to fetch a specific post.

   - **POST /posts**
     - Payload:
       ```json
       {
         "post": {
           "title": "My New Post",
           "content": "This is the content of the new post."
         }
       }
       ```
     - This endpoint creates a new post.

   - **PUT /posts/:id**
     - Replace `:id` with the post ID to update a specific post.
     - Payload:
       ```json
       {
         "post": {
           "title": "Updated Post Title",
           "content": "Updated content of the post."
         }
       }
       ```

   - **DELETE /posts/:id**
     - Replace `:id` with the post ID to delete a specific post.

   ### User Profile Endpoints:
   
   - **GET /users/:id**
     - Replace `:id` with the user ID to fetch details of a specific user.

   - **GET /users/:id/posts**
     - Replace `:id` with the user ID to fetch posts made by the user.
     
## Testing the Application

To run the tests for the application, use the following command:

```bash
rspec
