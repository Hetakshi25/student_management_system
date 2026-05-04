# Student Management System

A comprehensive school management platform built with Django. This system handles student and teacher records, attendance tracking, fee management, and academic results.

## Key Features
- **Multi-role Access**: Separate dashboards for Admin, Teachers, and Students.
- **Academic Management**: Course and subject allocation, attendance tracking, and marks/results processing.
- **Administrative Tools**: Fee collection, teacher salary management, and system-wide notifications.
- **Modern UI**: Responsive design with a clean, glassmorphism-inspired aesthetic.

## Setup Instructions

### 1. Requirements
Ensure you have Python installed. You'll need the following packages:
```bash
pip install django Pillow
```

### 2. Database Setup
The project is configured to use SQLite by default for easy local development.
```bash
python manage.py makemigrations
python manage.py migrate
```

### 3. Creating a Superuser
To access the admin panel:
```bash
python manage.py createsuperuser
```

### 4. Running the Application
```bash
python manage.py runserver
```
Visit `http://127.0.0.1:8000` to access the portal.

## Contact & Credits
Developed as an institutional management solution.
