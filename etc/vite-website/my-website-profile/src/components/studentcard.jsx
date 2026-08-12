export default function StudentCard({name, course, year}) {
	return (
		<div className="bg-[#72a25e] shadow-2xl rounded-2xl p-20 border-3 border-black justify-items-center">
			<div className="pb-10">
				<img src="../src/assets/jpg.jpg" width="200" className="rounded-full border-3"/>
			</div>

			<ul className="text-2xl text-center text-white">
				<li className="font-bold">{name}</li>
				<li>{course}</li>
				<li>{year}</li>
			</ul>

		</div>
	);
}
