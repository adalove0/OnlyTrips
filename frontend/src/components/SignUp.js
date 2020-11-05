import React from 'react';
import MD5 from 'MD5.js';


function SignUp()
{
        var username = document.getElementById("Username").value;
        var password = document.getElementById("Password").value;
        var verifiedPassword = document.getElementById("verify").value;
        if(username == "" || password == "" || verifiedPassword == "")
        {
            document.getElementById("create-text").innerHTML = "Enter all required fields";
            return;
        }
        if(password != verifiedPassword)
        {
            document.getElementById("create-text").innerHTML =  "Passwords don't match";
            return;
        }
        password = MD5(password);
        var data= '{"username" : "' + username +'", "password" : "' + password + '"}';
	    document.getElementById("create-text").innerHTML = "";
        var xhr = new XMLHttpRequest();
        xhr.open("POST",url,false);
        xhr.setRequestHeader("Content-type", "application/json; charset = UTF-8");
        try
        {
            xhr.send(data);
            var response = JSON.parse(xhr.responseText);
            var error = response["error"];
            if(error == "")
            {
                document.getElementById("Username").value = "";
                document.getElementById("Password").value = "";
                document.getElementById("verify").value = "";
            }
            else
                document.getElementById("create-text").innerHTML = "Username already exists";
        }
        catch(err){
            console.log(err.message);
        }

        return(
            <div id="signDiv">
                <img src={logo} alt="OnlyTrips Logo" id="logo"></ img>
                <form id = "SignUpForm" onSubmit={doSignUp}>
                    <input type="text" id="FirstName" placeholder="First Name" ref={(c) => fName = c} /><br />
                    <input type="text" id="LastName" placeholder="Last Name" ref={(c) => lName = c} /><br />
                    <input type="text" id="createPassword" placeholder="Create Password" ref={(c) => createPassword = c} /><br />
                    <input type="text" id="confirmPassword" placeholder="Confirm Password" ref={(c) => confirmPassword = c} /><br />
                    <input type="text" id="enterEmail" placeholder="Enter Email" ref={(c) => enterEmail = c} /><br />
                    <input type="text" id="confirmEmail" placeholder="Confirm Email" ref={(c) => confirmEmail = c} /><br />
                    <input type="submit" id="SignUpButton" class="buttons" value = "Sign Up!" onClick={doSignUp} /> 
                </form>
                <p id = "loginLink"> Have an account?  <a href={SignUp} id = "loginLink">Log In!</a></p>
            </div>  
    );
}
