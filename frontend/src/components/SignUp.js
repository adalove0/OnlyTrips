import React, {useState} from 'react';
import App from '../App';
import logo from '../images/OnlyTrips.svg'
import loginPage from '../pages/LoginPage.js'


function SignUp()
{

    var loginName;
    var lastName;
    var loginPassword;
    var loginEmail;
    var firstName;
    var lastName;
    var confirmPassword;
    var confirmEmail;

    const [message,setMessage] = useState('');

    const doSignUp = async event =>
    {   
        event.preventDefault();

        var obj = {login:loginName.value,password:loginPassword.value};
        var js = JSON.stringify(obj);

        try
        {    
            const response = await fetch('http://localhost:5000/api/login',
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

                setMessage('');
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
                    <input type="text" id="username" placeholder="Username" ref={(c) => loginName = c} /><br />
                    <input type="text" id="FirstName" placeholder="First Name" ref={(c) => firstName = c} /><br />
                    <input type="text" id="LastName" placeholder="Last Name" ref={(c) => lastName = c} /><br />
                    <input type="text" id="createPassword" placeholder="Create Password" ref={(c) => loginPassword = c} /><br />
                    <input type="text" id="confirmPassword" placeholder="Confirm Password" ref={(c) => confirmPassword = c} /><br />
                    <input type="text" id="enterEmail" placeholder="Enter Email" ref={(c) => loginEmail = c} /><br />
                    <input type="text" id="confirmEmail" placeholder="Confirm Email" ref={(c) => confirmEmail = c} /><br />
                    <input type="submit" id="SignUpButton" class="button" value = "Sign Up!" onClick={doSignUp}  /> 
                </form>
                <p id = "loginLink"> Have an account?  <a id='Link' onClick={goToLogin} > Log In! </a></p>
            </div>  
    );
};

export default SignUp;


