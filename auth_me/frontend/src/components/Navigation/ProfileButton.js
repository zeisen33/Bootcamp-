import React from "react";
import { useDispatch } from "react-redux";
import * as sessionActions from '../../store/session'
import { useState, useEffect } from 'react'

const ProfileButton = ({ user }) => {
    const dispatch = useDispatch();
    const [showMenu, setShowMenu] = useState(false)

    const openMenu =() => {
        // debugger
        if (showMenu) return 
        setShowMenu(true)
    }

    useEffect(() => {
        if (!showMenu) return

        const closeMenu = () => {
            // debugger
            setShowMenu(false)
        }
    
        document.addEventListener('click', closeMenu)

        return () => document.removeEventListener('click', closeMenu)
    }, [showMenu])


    const logout = (e) => {
        e.preventDefault();
        dispatch(sessionActions.logout());
    };

    return (
        <>
            <button onClick={openMenu} >
                <i className='fa-solid fa-user-circle' />
            </button>
            {showMenu && (
                <ul className='profile-dropdown'>
                    <li>{user.username}</li>
                    <li>{user.email}</li>
                    <li>
                        <button onClick={logout}>Log Out</button>
                    </li>
                </ul>
            )}
        </>
    )
}

export default ProfileButton;