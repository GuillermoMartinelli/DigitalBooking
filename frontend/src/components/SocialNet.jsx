import React from "react";
import {
  imgLinkedin,
  imgFacebook,
  imgTwitter,
  imgInstagram,
} from "../styleAux/fontAwesoneIcon";

const SocialNet = () => {
  return (
    <>
      <button>{imgFacebook}</button>
      <button>{imgLinkedin}</button>
      <button>{imgTwitter}</button>
      <button>{imgInstagram}</button>
    </>
  );
};

export default SocialNet;
