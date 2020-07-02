# README

This example implements SAML test connector with OneLogin Ruby Toolkit.

Getting Started
---------------
1. Download the project code
2. Run: `bundle install`
3. Setup variables in `.env` file
4. Start rails server: `rails s`
5. Go to http://localhost:3000 and try login/logout

Overview
--------
This example use the Ruby SAML library for ruby.
The Ruby SAML library is for implementing the client side of a SAML authorization, i.e. it provides a means for managing authorization initialization and confirmation requests from identity providers.

SAML authorization is a two step process and you are expected to implement support for both.

`https://github.com/onelogin/ruby-saml`

Demo
----
Base on

`https://github.com/onelogin/ruby-saml-example`
