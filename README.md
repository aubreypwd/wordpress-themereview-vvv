# VVV Theme Development and Review

This is an [auto-sitesetup](https://github.com/Varying-Vagrant-Vagrants/VVV/wiki/Auto-site-Setup) designed to be used with [Varying Vagrants Vagrant](https://github.com/Varying-Vagrant-Vagrants/VVV) for developing and reviewing themes.

## To get started:

1. Clone this branch of this repo into the `www` directory of your Vagrant as `www/theme-review`
2. If your Vagrant is running, from the Vagrant directory run `vagrant halt`
3. Followed by `vagrant up --provision`.  Perhaps a cup of tea or coffee now? The provisioning may take a while.

Then you can visit [http://theme-review.dev](http://theme-review.dev) to start developing or reviewing themes.

## Dependencies
- [Varying Vagrants Vagrant](https://github.com/Varying-Vagrant-Vagrants/VVV) - [Installation guide](https://github.com/Varying-Vagrant-Vagrants/VVV#the-first-vagrant-up)
- [vagrant-hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) - Install with `vagrant plugin install vagrant-hostsupdater`

## What will happen?
- Install WordPress and import "Theme Unit Test Data"
- Uninstall "Hello Dolly"
- Install & activate "Developer"
- Install & activate "Theme Check"
- Install & activate "Theme Mentor"
- Install & activate "Theme Checklist"
- Install & activate "What The File"
- Install & activate "VIP Scanner"
- Install & activate "Query Monitor"
- Install & activate "WordPress Database Reset"
- Install & activate "Toolbar Theme Switcher"
- Install & activate "RTL Tester"
- Install & activate "Pig Latin"
- Install & activate "Airplane Mode"
- Install & activate "GitHub Updater"

## Credentials and Such

### Theme Review
* Username: `admin`
* Password: `password`
* Login: [login](http://theme-review.dev/wp-login-php)
* LOCAL PATH: vagrant-local/www/theme-review
* VM PATH: /srv/www/theme-review
* URL: `http://theme-trunk.dev`
* DB Name: `theme_review`

### MySQL Root
* User: `root`
* Pass: `root`
* See: [Connecting to MySQL](https://github.com/varying-vagrant-vagrants/vvv/wiki/Connecting-to-MySQL) from your local machine

---

Based off [wordpress-themereview-vvv](https://github.com/aubreypwd/wordpress-themereview-vvv)

License MIT