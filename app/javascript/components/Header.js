import React from "react";
import { Link } from "react-router-dom";

const Header = () => {
  return (
    <header>
      <Link to="/events">
        <h1>Event Manager</h1>
      </Link>
    </header>
  );
};

export default Header;
