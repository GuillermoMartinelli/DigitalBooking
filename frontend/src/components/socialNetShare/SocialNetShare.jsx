import React from "react";
import TelegramShare from "./TelegramShare";
import TwitterShare from "./TwitterShare";
import WhatsappShare from "./WhatsappShare";
import "../../styles/socialNetShare/socialNetShare.css";

const SocialNetShare = ({ title, url }) => {
  return (
    <>
      <TwitterShare title={title} url={url} />
      <WhatsappShare title={title} url={url} />
      <TelegramShare title={title} url={url} />
    </>
  );
};

export default SocialNetShare;
