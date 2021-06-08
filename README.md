# Flutter fetch Users, Posts and Album using Provider State Management

- PROVIDER package is used for data management present in ```providers``` folder.
- I have also used model for decoding the JSON data present in ```models``` folder.

### The home page is ```users_list.dart``` which displays all the users.
#### I have implemented ```Circular Loading Indicator``` while the app fetches the data.
<img src="screenshots/1.png" width="300">

#### Users List
<img src="screenshots/2.png" width="300">

### Tapping in user redirects to new screen named ```my_tab_bar.dart```
- ``my_tab_bar.dart`` has two tabs. Each tab has two screens, ```users_post.dart``` and ```users_album.dart```
#### Posts
<img src="screenshots/3.png" width="300">

#### Albums
- It makes use of GridView.biulder
<img src="screenshots/4.png" width="300">
