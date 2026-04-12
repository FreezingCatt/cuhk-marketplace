# CUHK Second-hand Marketplace SaaS - Specification

## 1. Project Overview

### Project Name
CUHK Second-hand Marketplace

### Project Type
Multi-tenant SaaS Application (Ruby on Rails 7+)

### Core Functionality Summary
A centralized trading platform for CUHK students with community-based organization where different hostels/colleges act as "Communities" with customizable trading rules.

### Target Users
- CUHK students who want to buy/sell second-hand items
- Student societies managing trading communities
- Different colleges/hostels as independent trading communities

---

## 2. Team Members

| Member | Name | Student ID | GitHub |
|--------|------|------------|--------|
| Member 1 | Lu Zihuan | 1155210931 | FreezingCatt |
| Member 2 | Li Zinuo (lizi) | - | - |
| Member 3 | Wai Chung TSEUNG | - | - |
| Member 4 | Yuzhe ZHANG | - | - |

---

## 3. Problem Statement (Pain Points)

1. **Fragmented Channels**: Students trade via Facebook groups, WeChat, WhatsApp - information scattered
2. **Security Concerns**: No identity verification, risk of fraud and scams
3. **Status Transparency**: Unable to track if items are reserved/sold
4. **Poor Search Experience**: No unified search or categorization
5. **Community Isolation**: Different colleges have different trading rules

---

## 4. Solution Overview

**Autonomous Communities**: Different hostels/colleges as "Communities" with customizable rules

---

## 5. Core Features

### 5.1 User Authentication & Authorization
- User registration with email verification
- Login/logout functionality
- Role-based access (User, Community Manager, Admin)
- Devise-based authentication with Pundit authorization

### 5.2 Community Management
- Create and manage trading communities
- Custom community rules
- Community membership
- Public/private community visibility

---

## 6. Technical Stack

- **Framework**: Ruby on Rails 7+
- **Database**: PostgreSQL (SQLite for development)
- **Authentication**: Devise
- **Authorization**: Pundit
- **Testing**: RSpec + Cucumber
- **Pagination**: Kaminari
- **Deployment**: Heroku/Render

---

## 7. Database Schema

### Users
- id, email, encrypted_password, name, role, confirmed_at, created_at

### Communities
- id, name, description, rules, is_public, active, owner_id, created_at

### Community Memberships
- id, user_id, community_id, role, created_at

---

## 8. Acceptance Criteria

### User Auth
- [ ] User can register with valid email
- [ ] User receives verification email
- [ ] User can login with verified account
- [ ] Admin can manage users

### Community System
- [ ] User can create communities
- [ ] Community owner can edit/delete community
- [ ] Community has custom rules
- [ ] User can join communities
- [ ] Communities are public or private

---

## 9. Feature Ownership Table

| Feature Name | Primary Developer | Secondary Developer | Notes |
|--------------|-------------------|---------------------|-------|
| User Auth & Roles | Lu Zihuan | - | Devise + Pundit |
| Community System | Wai Chung TSEUNG | - | Multi-tenancy |
