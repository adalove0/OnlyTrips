import React, {useState} from 'react';
import App from '../App';
import logo from '../images/OnlyTrips.svg'
import loginPage from '../pages/LoginPage.js'


function SignUp()
{

    var loginEmail;
    var firstLastName;
    var loginPassword;
    var loginEmail;
    var confirmPassword;
    var confirmEmail;
    var age;

    const [message,setMessage] = useState('');

    const doSignUp = async event =>
    {   
        if(loginEmail!= confirmEmail)
        {
            setMessage("Login Emails dont match");
            return;
        }

        if(loginPassword != confirmPassword)
        {
            setMessage("Passwords dont match");
            return;
        }
        event.preventDefault();

        var obj = {
                    email:loginEmail.value,
                    name: firstLastName.value,
                    password:loginPassword.value,
                    age: age.value,
                    // location: an array maybe?,
                };
                
        var js = JSON.stringify(obj);

        try
        {    
            const response = await fetch('http://localhost:5000/api/backend/routes/signup',
                {method:'POST',body:js,headers:{'Content-Type': 'application/json'}});

            var res = JSON.parse(await response.text());

            if( res.id <= 0 )
            {
                setMessage('User/Password combination incorrect');
            }
            else
            {
                var user = {firstName:res.firstName,lastName:res.lastName,id:res.id}
                localStorage.setItem('user_data', JSON.stringify(user));
                
                alert(res.id + '' + res.email);
                setMessage(res.id + '' + res.email);
                window.location.href = '#/onlytrips';
            }
        }
        catch(e)
        {
            alert(e.toString());
            return;
        }   
    };

    const goToLogin = async event =>
    {   
        event.preventDefault();
        window.location.href='/';
        
    };

        return(
            <div id="signUpDiv">
                <img src={logo} alt="OnlyTrips Logo" id="logo"></ img>
                <form id = "SignUpForm" onSubmit={doSignUp}>
                    <input type="text" id="textbox" placeholder="Email" ref={(c) => loginEmail = c} /><br />
                    <input type="text" id="textbox" placeholder="Confirm Email" ref={(c) => confirmEmail = c} /><br />
                    <input type="text" id="textbox" placeholder="First Name" ref={(c) => firstLastName = c} /><br />
                    <input type="password" id="textbox" placeholder="Create Password" ref={(c) => loginPassword = c} /><br />
                    <input type="password" id="textbox" placeholder="Confirm Password" ref={(c) => confirmPassword = c} /><br />
                    <input type="number" id="textbox" placeholder="age" ref={(c) => age = c} /><br /><br />
                    <input type="submit" id="SignUpButton" class="button" value = "Sign Up!" 
                    onClick={doSignUp}  style={{cursor:'pointer'}}/> 
                </form>
                <p id = "loginLink"> Have an account?  <a id='Link' onClick={goToLogin} > Log In! </a></p>
            </div>  
    );
};

export default SignUp;


