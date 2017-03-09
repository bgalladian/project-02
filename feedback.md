# Project 2 Evaluation

## Technical Requirements
**3: Excelling**
>Includes many well-structured models, and advanced functionality such as authorization, 3rd-party API integration, or other technology not covered in class

## Creativity and Interface
**3: Excelling**
>The app is fully responsive, incorporates outside technologies such as Flexbox. App incorporates modern UI themes, and adds unique flair.

## Code Quality
**3: Excelling**
>No major code quality issues, makes use of Ruby best practices appropriately, and follows techniques such as separation of concerns, abstraction, and encapsulation

## Deployment and Functionality
**2: Performing**
>Application contains no major errors, is deployed correctly, and contains a custom Heroku app name appropriate for the app.

## Planning / Process / Submission
**2: Performing**
>Submission contains clear evidence of planning, adequate documentation, include all from previous category, as well as additional information such as unsolved issues.

## Inline Code Comments

```diff
diff --git a/app/assets/stylesheets/application.css b/app/assets/stylesheets/application.css
index ff0775d..df1f23a 100644
--- a/app/assets/stylesheets/application.css
+++ b/app/assets/stylesheets/application.css
@@ -128,6 +128,8 @@ hr {
   padding-left: 15%;
 }

+/*Really awesome styling on your links. Nice use of transform.*/
+
 /*links*/
 a {
   display: inline-block;
diff --git a/app/controllers/movies_controller.rb b/app/controllers/movies_controller.rb
index 7ce5e74..2a9d954 100644
--- a/app/controllers/movies_controller.rb
+++ b/app/controllers/movies_controller.rb
@@ -1,7 +1,9 @@
 class MoviesController < ApplicationController
   before_action :authenticate_user!, except: [:index, :show]
+  # Good implementation of user authentication

   def index
+    # Good job using one view with added search functionality
   @movies = Movie.all
   if params[:search]
     @movies = Movie.search(params[:search]).order("title")
@@ -31,6 +33,10 @@ end
     @movie = Movie.find(params[:id])
     @movie.update(movie_params)
     redirect_to movie_path
+    # While rails does allow you to simply specify `movie_path` here because the
+    # variable `@movie` matches the path name, I would suggest always being specific
+    # in any path helpers that are not index routes (i.e. `movies_path` is fine but
+    # for a specific movie, `movie_path(@movie)` is slightly more intentional and readable)
   end

   def destroy
diff --git a/app/controllers/reviews_controller.rb b/app/controllers/reviews_controller.rb
index c8fbf81..9b5abf6 100644
--- a/app/controllers/reviews_controller.rb
+++ b/app/controllers/reviews_controller.rb
@@ -32,6 +32,8 @@ before_action :authenticate_user!, except: [:index, :show]
     @review = Review.find(params[:id])
     @review.update(review_params)
     redirect_to movie_review_path(@movie)
+    # Same here, be more specific since this path helper is references a specific
+    # review of a specific movie (i.e. movie_review_path(@movie, @review))
   end

   def destroy
diff --git a/app/models/movie.rb b/app/models/movie.rb
index 8753d7c..fe92f1a 100644
--- a/app/models/movie.rb
+++ b/app/models/movie.rb
@@ -5,5 +5,5 @@ class Movie < ActiveRecord::Base
   def self.search(search)
   where("title ILIKE ?" , "%#{search}%")
   end
-
+  # Impressive implementation of class methods for search functionality
 end
diff --git a/app/views/devise/registrations/edit.html.erb b/app/views/devise/registrations/edit.html.erb
index 1e66f3d..47efdb5 100644
--- a/app/views/devise/registrations/edit.html.erb
+++ b/app/views/devise/registrations/edit.html.erb
@@ -1,3 +1,4 @@
+<%# Nice job bringing in devise views for customization %>
 <h2>Edit <%= resource_name.to_s.humanize %></h2>

 <%= form_for(resource, as: resource_name, url: registration_path(resource_name), html: { method: :put }) do |f| %>
diff --git a/app/views/layouts/application.html.erb b/app/views/layouts/application.html.erb
index 88438d6..0e635c8 100644
--- a/app/views/layouts/application.html.erb
+++ b/app/views/layouts/application.html.erb
@@ -16,7 +16,7 @@
         <%= text_field_tag :search, params[:search], placeholder: "Search Movies" %>
         <%= submit_tag "Search", :name => nil %>
         <% end %>
-
+        <%# Nice configuration for adding search query to params %>
       </div>

         <div class = "nav-user">
@@ -33,7 +33,8 @@
   </head>
 <body>
   <!-- <p> <a href = "/movies/new"> Add Movie for Review </a></p> -->
-
+<%# In ERB files, be careful of just using CMD+? for commenting out.
+The above comment could cause an error. One formatted like this one won't. %>



diff --git a/app/views/movies/edit.html.erb b/app/views/movies/edit.html.erb
index 71337b3..d7520f7 100644
--- a/app/views/movies/edit.html.erb
+++ b/app/views/movies/edit.html.erb
@@ -1,6 +1,7 @@
 <br>
 <br>
 <div class = "form">
+<%# If you wanted, you could create a partial form view that is rendered both here and in the edit view %>
 <%= form_for @movie, url:"/movies/#{@movie.id}" do |f| %>

   <%= f.label :title %>
diff --git a/app/views/movies/index.html.erb b/app/views/movies/index.html.erb
index 29e3db2..38e4e03 100644
--- a/app/views/movies/index.html.erb
+++ b/app/views/movies/index.html.erb
@@ -4,6 +4,8 @@
   <h4>There are no movies with the title  "<%= params[:search] %>".  You should add it!</h4>
 <% end %>

+<%# Really well formatted interface %>
+
 <h3>Welcome to <font color = "gold">"Was It Worth It?"</font>, where we ask if the movie was worth it or not!
   We don't have traditional rating methods, so let me explain how we do things around here.
   We have four ratings that should help users decide whether or not a movie is worth it:
diff --git a/config/routes.rb b/config/routes.rb
index 298441c..1b8085c 100644
--- a/config/routes.rb
+++ b/config/routes.rb
@@ -1,7 +1,7 @@
 Rails.application.routes.draw do
   devise_for :users
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
-
+  # Good use of resources, root to, and devise to set up restful routes
   root to: "movies#index"
   resources :movies do
     resources :reviews do
diff --git a/db/migrate/20170228143102_devise_create_users.rb b/db/migrate/20170228143102_devise_create_users.rb
index f577233..f9fd316 100644
--- a/db/migrate/20170228143102_devise_create_users.rb
+++ b/db/migrate/20170228143102_devise_create_users.rb
@@ -1,4 +1,5 @@
 class DeviseCreateUsers < ActiveRecord::Migration[5.0]
+  # Good use of Devise
   def change
     create_table :users do |t|
       ## Database authenticatable
diff --git a/db/migrate/20170228155540_add_users_to_movies.rb b/db/migrate/20170228155540_add_users_to_movies.rb
index cbc4fc4..d136bdd 100644
--- a/db/migrate/20170228155540_add_users_to_movies.rb
+++ b/db/migrate/20170228155540_add_users_to_movies.rb
@@ -3,3 +3,4 @@ class AddUsersToMovies < ActiveRecord::Migration[5.0]
     add_reference :movies, :user, foreign_key: true
   end
 end
+# Good idea setting up main models first and then adding in references to users after
diff --git a/db/seeds.rb b/db/seeds.rb
index 306506a..1e32630 100644
--- a/db/seeds.rb
+++ b/db/seeds.rb
@@ -13,3 +13,5 @@ Comment.destroy_all

 #movies
 casino = Movie.create(title: "Casino", director: "Martin Scorcese", summary: "Greed, deception, money, power, and murder occur between two best friends, a mafia underboss and a casino owner, for a trophy wife over a gambling empire.", written_by: "Nicholas Pileggi", release_date: "11/22/1995", poster_url: "https://images-na.ssl-images-amazon.com/images/M/MV5BMTcxOWYzNDYtYmM4YS00N2NkLTk0NTAtNjg1ODgwZjAxYzI3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SY1000_CR0,0,666,1000_AL_.jpg" )
```
