# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## Getting Started

Follow these steps to get your local development environment up and running.

### 1. Prerequisites
Ensure you have **Docker** and **Docker Compose** installed on your machine (or use GitHub Codespaces).

### 2. Launch the Environment
Build the images and start the containers in detached mode:
```bash
docker-compose up --build -d

Once the containers are running, run the following command to set up the database schema:
docker-compose exec web rails db:prepare