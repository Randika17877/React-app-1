import React, { useState } from 'react'
import { AiFillHeart } from "react-icons/ai";
import { AiOutlineHeart } from "react-icons/ai";

interface Props {
    onClick?: () => void;
}
const Like = ({ onClick }: Props) => {

    const [status, setStatus] = useState(true);

    const toggle = () => {
        setStatus(!status);
        if (onClick) onClick();
    }

  if (status) return <AiFillHeart  color='#f00c2f' size={20} onClick={toggle}/>;
  return <AiOutlineHeart size={20} onClick={toggle}/>;
}

export default Like