<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Welcome</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100">

	<nav class="bg-gradient-to-r from-cyan-500 to-blue-500 p-4">
		<div class="container mx-auto flex justify-between items-center">

			<a href="welcome.jsp"
				class="text-white text-2xl font-bold hover:text-indigo-200"> <span
				class="text-yellow-400">Interra</span>IT
			</a>

			<div
				class="space-x-4 bg-red-500 p-1 rounded-lg hover:bg-red-600 px-3 py-2">
				<a href="LogoutServlet" class="text-white hover:text-indigo-200">Logout</a>
			</div>

		</div>
	</nav>

	<div class="container mx-auto p-8 mt-20">
		<div
			class="max-w-3xl mx-auto bg-white p-8 border shadow-lg rounded-lg">
			<h1 class="text-3xl font-semibold text-center text-gray-800">
				Welcome</h1>
			<p class="mt-4 text-center text-gray-600">We're happy to have you
				on board. Choose an action below:</p>

			<div class="mt-8 grid grid-cols-1 md:grid-cols-2 gap-6">
				<div>
					<a href="profile.jsp"
						class="w-full block text-center py-3 px-4 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700 transition ease-in-out duration-200">
						Profile </a>
				</div>
				<div>
					<a href="about.jsp"
						class="w-full block text-center py-3 px-4 bg-green-600 text-white font-semibold rounded-md hover:bg-green-700 transition ease-in-out duration-200">
						About Us </a>
				</div>

			</div>
		</div>
	</div>

	<footer class="bg-gray-800 text-white fixed bottom-0 w-full">
    <div class="container mx-auto mt-2 text-center">
        <p> 2024 InterraIT. All Rights Reserved.</p>
        <div class="mt-2">
            <a href="mailto:vivekmishra89994@gmail.com" class="text-blue-400 hover:text-blue-600">Contact Us</a>
        </div>
    </div>
</footer>


</body>

</html>
