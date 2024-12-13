<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>

<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">

	<nav class="bg-gradient-to-r from-cyan-500 to-blue-500 p-4">
		<div class="container mx-auto flex justify-between items-center">

			<a href="welcome.jsp"
				class="text-white text-2xl font-bold hover:text-indigo-200"> <span
				class="text-yellow-400">Interra</span>IT
			</a>

			<div class="space-x-4">
				<a href="welcome.jsp" class="text-white hover:text-indigo-200">Home</a>
				<a href="about.jsp" class="text-white hover:text-indigo-200">About</a>
				<a href="LogoutServlet"
					class="space-x-4 bg-red-500 p-1 rounded-lg hover:bg-red-600 px-3 py-2">Logout</a>
			</div>
		</div>
	</nav>

	<div class="container mx-auto p-8 mt-16">
		<div class="max-w-2xl mx-auto bg-white p-6 rounded-lg shadow-lg">
			<h2 class="text-2xl font-semibold text-center mb-6">Welcome,<span class="text-red-500 uppercase font-bold">${sessionScope.session_name}</span>
				</h2>

			<table class="min-w-full border-collapse">
				<tbody>
					<tr class="border-b">
						<td class="px-4 py-2 font-medium">Name</td>
						<td class="px-4 py-2">${sessionScope.session_name}</td>
					</tr>
					<tr class="border-b">
						<td class="px-4 py-2 font-medium">Email</td>
						<td class="px-4 py-2">${sessionScope.email}</td>
					</tr>
					<tr class="border-b">
						<td class="px-4 py-2 font-medium">Address</td>
						<td class="px-4 py-2">${sessionScope.address}</td>
					</tr>
					<tr class="border-b">
						<td class="px-4 py-2 font-medium">Mobile</td>
						<td class="px-4 py-2">${sessionScope.mobile}</td>
					</tr>
					<tr class="border-b">
						<td class="px-4 py-2 font-medium">Date of Joining</td>
						<td class="px-4 py-2">${sessionScope.DOJ}</td>
					</tr>


					<tr class="border-b">
						<td class="px-4 py-2 font-medium">Gender</td>
						<td class="px-4 py-2">${sessionScope.gender}</td>
					</tr>

				</tbody>
			</table>

			<div class="mt-6 text-center">
				<a href="updateProfile.jsp"
					class="bg-blue-500 text-white px-6 py-2 rounded-full hover:bg-blue-600 transition duration-300">Update
					Profile</a>
			</div>
		</div>
	</div>

</body>
</html>
