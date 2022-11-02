// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as HistoryList from "./HistoryList.bs.js";

import './History.css';
;

function $$History(Props) {
  var expenses = Props.expenses;
  var onRemoveItem = Props.onRemoveItem;
  return React.createElement("div", {
              className: "history"
            }, React.createElement("h3", undefined, "History"), React.createElement(HistoryList.make, {
                  expenses: expenses,
                  onRemoveItem: onRemoveItem
                }));
}

var make = $$History;

export {
  make ,
}
/*  Not a pure module */
