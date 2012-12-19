My friends a while ago mentioned that they were looking for a social network site so that alumni from my high school around the world can join and keep in touch. They felt that popular forums and social network sites were not really tailored to their specific needs. For example, Facebook lacks a good way to organize posts into categories while forums support that option but just look too ugly.

I take this opportunity as an exercise to code up a simple social network website - NKnet - using Ruby on Rails. The name is an abbreviation of the school's name.

From what I heard, the site should meet the following *tentative* requirements:
* Each person will have a user account. There are two types of account: regular and administrator.
* A regular account is able to post a thread, comment, upload pictures, like/dislike a thread or a comment, and report either of those. A administrator account has all the functions of a regular account but will also have the power to suspend an account, delete a thread or picture, and accept new accounts.
* All accounts log in with an email address and password. The email address is use for contact and it must be verified before the account is activated. All accounts must also have first name, last name, and a profile picture. Password can be reset.
* A good and simple way to search for threads, comments, and accounts. "Good" means the search should support closest matching.
* A good and simple way to group threads or pictures into categories or remove threads or pictures from categories (a thread or a picture can fall under multiple categories). Using tags is one possible solution. 
* A nice, simple, usable interface. It should show relevant content and should not flood the user with too many buttons, spaces, decorations, or senseless visual effects.
* Threads/pictures should be listed according to their popularity (from most popular to least popular).
