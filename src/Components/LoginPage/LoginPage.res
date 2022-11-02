
%%raw(`import './LoginPage.css';`)
let initialState:LoginState.t = {username:"",password:""}
@react.component
let make = (~handleLogin,
            ~loginState:bool) => {
    let (inputState: LoginState.t,setInputState) = React.useState(_=>initialState)
    let(submitState: bool,setSubmitState) = React.useState(_=>false)

let usernameChangeHandler = event => {
    setInputState(prev=>{...prev,username:ReactEvent.Form.target(event)["value"]})
}
let passwordChangeHandler = event => {
        setInputState(prev=>{...prev,password:ReactEvent.Form.target(event)["value"]})
}
let loginSubmitHandler = event => {
            ReactEvent.Form.preventDefault(event);
            setSubmitState(_=>true)
            handleLogin(inputState)

}
    
    <form className ="login-form" onSubmit={loginSubmitHandler}>
    <div className="form_controls">
    <label htmlFor = "username">{"username"->React.string}</label>
    <input id = "username" type_="text" onChange={usernameChangeHandler} />
    </ div>
       <div className="form_controls">
    <label htmlFor = "password" >{"password"->React.string}</label>
    <input onChange={passwordChangeHandler} id = "password" type_="password" placeholder="password" />
    </div>
    {!loginState&&submitState?<p className="warning-text">{"Please Enter correct username or password"->React.string}</p>:React.null}
    <button>{"Login"->React.string}</button>
    </form>

}