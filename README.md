# Blood Bank & Donor Management System (BBDMS)

A PHP/MySQL web application for managing blood donors and blood requests, with a public site for visitors/donors and an admin panel.

## Features
- **Public site:** home, about, contact, donor search by blood group, donor list
- **Donors:** sign up, log in, edit profile, change password, view blood requests
- **Blood requests:** contact a donor to request blood
- **Admin panel (`/admin`):** dashboard, add/manage donors, manage blood groups, view blood requests, manage pages and contact info, handle contact queries, download records

## Tech stack
PHP (PDO), MySQL/MariaDB, Bootstrap, jQuery, Chart.js, DataTables

## Setup
1. Install a local stack such as XAMPP/WAMP/LAMP (PHP 7.4+ and MySQL).
2. Copy the project folder into your web root (e.g. `htdocs/bbdms`).
3. Create a MySQL database named `bbdms` and import the SQL dump (add it to a `database/` folder).
   The code expects these tables: `tbladmin`, `tblblooddonars`, `tblbloodgroup`, `tblbloodrequirer`, `tblcontactusinfo`, `tblcontactusquery`, `tblpages`.
4. Create your config files from the samples:
   ```bash
   cp includes/config.sample.php includes/config.php
   cp admin/includes/config.sample.php admin/includes/config.php
   ```
   Then edit the DB credentials in both files.
5. Open `http://localhost/bbdms/` (admin at `http://localhost/bbdms/admin/`).

## Notes
- `config.php` files are git-ignored so credentials aren't committed.
- Change any default admin password after importing the database.
