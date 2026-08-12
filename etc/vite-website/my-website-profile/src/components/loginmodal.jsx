import { useState } from "react";

export default function
    LoginModal({isOpen,onClose}) {

        const[username,setUsername] = useState("");
        const[password,setPassword] = useState("");

    if(!isOpen) return null;

        return (
            <div className="fixed inset-0 bg-black bg-opacity-45 flex justify-center items-center z-50">
            <div className="bg-white p-10 rounded-xl shadow-2xl w-full max-w-lg mx-4">
            <h2 className="text-3xl font-bold mb-6 text-center">LOGIN</h2>

            <input
                type="username"
                placeholder="Username"
                className="border-2 p-3 w-full mb-6 rounded-md text-lg"
                value={username}

            onChange={(e) => setUsername(e.target.value)}
                />

            <input
                type="password"
                placeholder="Password"
                className="border-2 p-3 w-full mb-6 rounded-md text-lg"
                value={password}

            onChange={(e) => setPassword(e.target.value)}
                />

            <div className="flex justify-end gap-4">
                <button
                    onClick={onClose}
                    className="bg-gray-300 hover:bg-gray-400 duration-300 px-6 py-3 rounded text-lg">CANCEL</button>

            <button
                className="bg-[#f9b409] hover:bg-green-600 duration-300 text-white px-6 py-3 rounded font-bold text-lg"
                    >LOGIN</button>

            </div>
        </div>
     </div>
    );
  }
