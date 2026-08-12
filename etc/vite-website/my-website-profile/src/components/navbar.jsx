import { useState } from 'react';
import LoginModal from './loginmodal';
export default function NavBar() {

    const [isModalOpen, setIsModalOpen] = useState(false);

return (
    <>

    <nav className="font-[Arial] flex justify-between items-center p-3 bg-[#333333] text-black text-xl">
    <h1 className="font-bold text-white cursor-pointer p-3 rounded-xl">STUDENT PORTAL </h1>

        <ul className="flex gap-10 justify-items-center">
            <li className="cursor-pointer duration-500 bg-[#c3b49e] hover:bg-[#72a25e] rounded-xl p-4">Home</li>
            <li className="cursor-pointer duration-500 bg-[#c3b49e] hover:bg-[#72a25e] rounded-xl p-4">About Me</li>
            <li className="cursor-pointer duration-500 bg-[#c3b49e] hover:bg-[#72a25e] rounded-xl p-4">Contact</li>
        </ul>

        <div className="flex gap-5 justify-right">  
            <button onClick={() => setIsModalOpen(true)}
                className="p-4 cursor-pointer duration-500 hover:bg-green-400 bg-[#f9d16a] rounded-xl">LOGIN</button>
        </div>
    </nav>

        <LoginModal isOpen={isModalOpen}
            onClose={() => setIsModalOpen(false)} />
   </>
  );
 }


