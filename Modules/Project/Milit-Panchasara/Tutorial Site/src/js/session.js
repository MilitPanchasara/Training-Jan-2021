'use strict';

var session = function() { // session class
   
};
// function to check session status
session.prototype.checkSession = function() {
    let userData = localStorage.getItem('logged_in_user_data');
    let userID = localStorage.getItem('logged_in_user');
    if(userID == null || userData == null) { // if one is null session is over and redirect to login page.
        window.location.href='/html/login.html';
        return false;
    }
    return true;
};

//function to avoid user from opening login page.
session.prototype.isLoggedIn = function() {
    let userData = localStorage.getItem('logged_in_user_data');
    let userID = localStorage.getItem('logged_in_user');
    if(userID != null && userData != null) {
        window.location.href = '../index.html';
    }
};