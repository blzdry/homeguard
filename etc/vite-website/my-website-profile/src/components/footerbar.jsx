export default function Footer({title, schoolName, subCode, subDesc, year}) {
	return (
		<>
		<footer className="bg-[#7D7F7D] p-10 gap-5">
			<ul>
				<li className="text-2xl text-white font-bold mb-5">{title}</li>
				<li className="font-bold text-white">{schoolName}</li>
				<li className="text-white">{subCode} - {subDesc}</li>
				<li className="text-white">© {year} All Rights Reserved.</li>
			</ul>
		</footer>


		</>
	);
}
