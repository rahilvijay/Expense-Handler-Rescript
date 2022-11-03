%%raw(`import './InputForm.css';`)



let reducer = (state:InputState.t,action:ReducerAction.t) => {
    switch action {
        |SetRemarkValue(t) => {...state,title:t}
        |SetAmountValue(a) => {...state,amount:a}

        |SetRemarkValidState(s) => s !==""?{...state,titleState:true}:{...state,titleState:false}

        |SetAmountValidState(i) => Js.Math.abs_float(i)>0.0?{...state,amountState:true}:                     {...state,amountState:false}

        |SetAmountTouchState(b)=> {...state,amountTouched:b}
        |SetRemarkTouchState(b) => {...state,titleTouched:b}
        |SetInitial=> InputState.intial
    }
}

@react.component
let make = (~addItem:(InputData.t) => unit) => {
    let (inputState,dispatch) = React.useReducer(reducer,InputState.intial )
    
    let onRemarkChangeHandler = event => {
        let value:string = (ReactEvent.Form.target(event)["value"]) 
        dispatch(SetRemarkValue(value))
        dispatch(SetRemarkValidState(value))

    }
        let onAmountChangeHandler = event => {
        let value = ReactEvent.Form.target(event)["value"]
        let valueResolved  = switch (value->Belt.Float.fromString) {|None =>0.0 | Some(a)=>a}
        dispatch(SetAmountValue(value))
        dispatch(SetAmountValidState(valueResolved))

    }

    let onTitleBur = () => {
        dispatch(SetRemarkTouchState(true));

    }

      let onAmountBur = () => {
        dispatch(SetAmountTouchState(true));

    }
    let onSubmitHandler = event => {

            ReactEvent.Form.preventDefault(event);
            dispatch(SetRemarkTouchState(true))
            dispatch(SetRemarkTouchState(true))
             if(inputState.titleState && inputState.amountState) {
                let vaues = switch (inputState.amount->Belt.Float.fromString) {
                |None=>0.0 
                |Some(a)=>a
                }
                addItem({title:inputState.title,amount:vaues})
                dispatch(SetInitial)

            }else{
                dispatch(SetInitial)
                dispatch(SetRemarkTouchState(true))


            }

        
    }


    <form className="form" onSubmit={onSubmitHandler}>
    <p className="warning">{((!inputState.titleState&& inputState.titleTouched)?"Please correct Input":"")->React.string}</p>
    <p className="warning">{((!inputState.amountState&& inputState.amountTouched)?"Please correct Input":"")->React.string}</p>
    <div className= "form-controls">
        <label>{StaticText.inputFormLabel1->React.string}</label>
        <input onBlur ={_=>onTitleBur()} onChange = {onRemarkChangeHandler} type_="text" placeholder=StaticText.inputFOrmPH1 value={inputState.title} />
    </div>
    <div className= "form-controls">
        
        <label>{StaticText.inputFormLabel2->React.string}</label>
        <p>{StaticText.inputFormInfo->React.string}</p>
        <input onBlur={_=>onAmountBur()} onChange={onAmountChangeHandler} type_="number" placeholder=StaticText.inputFOrmPH2 value={inputState.amount} step=0.01/>
    </div>
    <button>{"Add New Expense"->React.string}</button>
</ form>
}