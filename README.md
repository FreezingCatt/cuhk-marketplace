# CSCI 3100 Software Engineering - Course Project

## CUHK Second-hand Marketplace SaaS

### Team Members

| Member | Name | Student ID | GitHub |
|--------|------|------------|--------|
| Member 1 | Lu Zihuan | 1155210931 | [FreezingCatt](https://github.com/FreezingCatt) |
| Member 2 | Li Zinuo (lizi) | - | - |
| Member 3 | Wai Chung TSEUNG | - | - |
| Member 4 | Yuzhe ZHANG | - | - |

---

## Selected Topic: CUHK Second-hand Marketplace SaaS

### Pain Points Analysis

1. **Fragmented Channels**: Students mainly trade via Facebook groups, WeChat, WhatsApp - information is scattered and hard to track

2. **Security Concerns**: No identity verification mechanism, risk of fraud and scams

3. **Status Transparency**: Unable to track if items are reserved/sold, leading to repeated inquiries and wasted time

4. **Poor Search Experience**: No unified search or categorization - users have to scroll through messy feeds

5. **Community Isolation**: Different colleges have different trading rules, but existing platforms don't support this

### Solution Overview

**Autonomous Communities**: Different hostels/colleges as "Communities" with customizable rules

---

## Features Overview

### Core Features

- **User Authentication & Authorization**
  - Registration with email verification
  - Role-based access (User, Community Manager, Admin)
  - Devise + Pundit for secure authentication

- **Community System**
  - Create and manage trading communities
  - Custom community rules
  - Community-specific listings
  - Public/private community visibility

---

## Feature Ownership Table

| Feature Name | Primary Developer | Secondary Developer | Notes |
|--------------|-------------------|---------------------|-------|
| User Auth & Roles | Lu Zihuan | - | Devise + Pundit |
| Community System | Wai Chung TSEUNG | - | Multi-tenancy |

---

## Technical Stack

- **Framework**: Ruby on Rails 7+
- **Database**: PostgreSQL (SQLite for development)
- **Authentication**: Devise
- **Authorization**: Pundit
- **Testing**: RSpec + Cucumber

---

## Setup Instructions

### Prerequisites

- Ruby 3.4.7
- Rails 7.1+
- PostgreSQL / SQLite

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd cuhk-marketplace
```

2. Install dependencies:
```bash
bundle install
```

3. Set up environment variables:
```bash
cp .env.example .env
```

Edit `.env` with your credentials:
```
DATABASE_PASSWORD=your_password
```

4. Set up the database:
```bash
rails db:create
rails db:migrate
rails db:seed
```

5. Start the server:
```bash
rails server
```

### Running Tests

```bash
# Run RSpec tests
bundle exec rspec

# Run Cucumber tests
bundle exec cucumber
```

---

## Deployment

The application is deployed on [Heroku/Render].

**Live URL**: [https://cuhk-marketplace.herokuapp.com](https://cuhk-marketplace.herokuapp.com)

### Docker Deployment

1. **Prerequisites**
   Ensure you have **Docker** and **Docker Compose** installed on your machine (or use GitHub Codespaces).

2. **Launch the Environment**
   Build the images and start the containers in detached mode:
   ```bash
   docker-compose up --build -d
   ```

   Once the containers are running, run the following command to set up the database schema:
   ```bash
   docker-compose exec web rails db:prepare
   ```

---

## Project Structure

```
app/
├── controllers/        # Rails controllers
├── helpers/            # View helpers
├── models/             # ActiveRecord models (User, Community, CommunityMembership)
├── policies/           # Pundit policies
└── views/              # ERB views
config/
├── environments/       # Environment configs
├── initializers/       # Gem initializers
└── routes.rb           # Routes definition
db/
├── migrate/             # Database migrations
└── schema.rb           # Database schema
features/               # Cucumber BDD tests
spec/                   # RSpec tests
```

---

## User Stories

### User
- As a user, I can sign up and log in
- As a user, I can create communities
- As a user, I can join communities
- As a community owner, I can manage my community

### Community Manager
- As a community manager, I can create communities
- As a community manager, I can set community rules
- As a community manager, I can manage community members

---

## Grading Criteria Coverage

| Criteria | Implementation |
|----------|---------------|
| Completeness | Core community features implemented |
| Complexity | Basic CRUD with role-based access |
| UX/UI | Intuitive interface |
| SaaS Architecture | Multi-tenant community system |
| Testing | RSpec (Unit) + Cucumber (BDD) |
| Code Quality | Follows Rails conventions (DRY, Skinny Controller) |
| Deployment | Live app on cloud platform |

---

## License

This project is for educational purposes as part of CSCI 3100 Software Engineering course at The Chinese University of Hong Kong.
