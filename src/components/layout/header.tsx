import * as React from "react";
import logo from '../../assets/images/logo-react-docker.png';

const Header: React.FC = () => {
  return (
    <>
      <nav className="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
        <a className="navbar-brand col-sm-3 col-md-2 mr-0" href="/#/">
          <img src={logo} alt="Logo" width="200" height="100" />{` `}React App On Docker
        </a>
      </nav>
    </>
  );
};

export default Header;
