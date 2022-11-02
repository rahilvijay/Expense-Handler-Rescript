// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as LoginPage from "./Components/LoginPage/LoginPage.bs.js";
import LogoSvg from "./logo.svg";

var logo = LogoSvg;

import './App.css';
;

var initialExpense = [];

var initialTotals = {
  income: 0.0,
  expense: 0.0
};

function App(Props) {
  var match = React.useState(function () {
        return initialExpense;
      });
  var expenses = match[0];
  React.useState(function () {
        return 2;
      });
  var match$1 = React.useState(function () {
        return initialTotals;
      });
  var setSubtotals = match$1[1];
  var match$2 = React.useState(function () {
        return false;
      });
  var setLoLogjinState = match$2[1];
  React.useEffect((function () {
          Curry._1(setSubtotals, (function (param) {
                  return {
                          income: expenses.reduce((function (sum, expense) {
                                  if (expense.amount > 0.0) {
                                    return expense.amount + sum;
                                  } else {
                                    return sum;
                                  }
                                }), 0.0),
                          expense: expenses.reduce((function (sum, expense) {
                                  if (expense.amount < 0.0) {
                                    return sum + expense.amount;
                                  } else {
                                    return sum;
                                  }
                                }), 0.0)
                        };
                }));
        }), [expenses]);
  var loginHandler = function (data) {
    if (data.username !== "" && data.password !== "") {
      return Curry._1(setLoLogjinState, (function (param) {
                    return true;
                  }));
    }
    
  };
  return React.createElement("div", {
              className: "app"
            }, React.createElement(LoginPage.make, {
                  handleLogin: loginHandler,
                  loginState: match$2[0]
                }));
}

var make = App;

export {
  logo ,
  initialExpense ,
  initialTotals ,
  make ,
}
/* logo Not a pure module */
