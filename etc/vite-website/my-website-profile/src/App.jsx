import StudentCard from "./components/studentcard"
import NavBar from "./components/navbar"
import Footer from "./components/footerbar"
//import LoginModal from "./components/loginmodal"

function App() {
  return (
    <>
      <NavBar />

      <div className="content-center justify-items-center h-screen">
        <StudentCard name="Jael P. Gonzal" course="BSCS" year="3rd Year (Junior)" />
      </div>

      <Footer 
        title="STUDENT PORTAL" 
        schoolName="University of Caloocan City" 
        subCode="CC-116" 
        subDesc="Advanced Web System and Technologies" 
        year="2026"
      />

    </>
  )
}

export default App
