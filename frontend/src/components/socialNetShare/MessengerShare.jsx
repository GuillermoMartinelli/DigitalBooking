import React from "react";
import { FacebookMessengerIcon, FacebookMessengerShareButton } from "react-share";

const MessengerShare = ({ title, url, quote }) => {
  return (
    <FacebookMessengerShareButton title={title} url={url} quote={quote} hashtag="#digitalBooking">
      <FacebookMessengerIcon className="icon" size={36} round />
    </FacebookMessengerShareButton>
  );
};

export default MessengerShare;
