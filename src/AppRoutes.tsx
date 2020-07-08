import * as React from "react";
import { Route, Switch } from "react-router";
import Home from "./pages/home/home";
import Contact from "./pages/contact/contact";

export const AppRoutes: React.FC = () => (
  <Switch>
    <Route exact path={"/"} component={Home} />
    <Route path={"/contact"} component={Contact} />
  </Switch>
);
