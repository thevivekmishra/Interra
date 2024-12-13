<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
 
    <script src="https://cdn.tailwindcss.com"></script>
    
    <script>
        // Function to set the max date as today to prevent future dates from being selected
        window.onload = function () {
            var today = new Date().toISOString().split('T')[0]; // Get today's date in YYYY-MM-DD format
            document.getElementById("doj").setAttribute("max", today);
        };
    </script>
</head>
<body class="bg-gray-100">

	<div class="container mx-auto p-8">
		<!-- Card for displaying update form -->
		<div class="max-w-2xl mx-auto bg-white p-6 rounded-lg shadow-lg">
			<h2 class="text-2xl font-semibold text-center mb-6">Update Your Profile</h2>

			<form action="UpdateProfileServlet" method="post">
				<div class="mb-4">
					<label for="name" class="block text-lg font-medium">Name</label>
					<input type="text" id="name" name="name" value="${sessionScope.session_name}" 
						class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
				</div>

				<div class="mb-4">
					<label for="address" class="block text-lg font-medium">Address</label>
					<input type="text" id="address" name="address" value="${sessionScope.address}" 
						class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
				</div>

				<div class="mb-4">
					<label for="mobile" class="block text-lg font-medium">Mobile</label>
					<input type="text" id="mobile" name="mobile" value="${sessionScope.mobile}" 
						class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
				</div>

				<div class="mb-4">
					<label for="doj" class="block text-lg font-medium">Date of Joining (DOJ)</label>
					<input type="date" id="doj" name="doj" value="${sessionScope.DOJ}" 
						class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" required>
				</div>

				<div class="mb-4">
					<label class="block text-lg font-medium">Gender</label>
					<div class="flex items-center">
						<input type="radio" id="gender_male" name="gender" value="Male" 
							${sessionScope.gender == 'Male' ? 'checked' : ''} class="mr-2">
						<label for="gender_male" class="text-sm text-gray-700">Male</label>

						<input type="radio" id="gender_female" name="gender" value="Female" 
							${sessionScope.gender == 'Female' ? 'checked' : ''} class="ml-4 mr-2">
						<label for="gender_female" class="text-sm text-gray-700">Female</label>
					</div>
				</div>

				<div class="text-center">
					<button type="submit" 
						class="bg-blue-500 text-white px-6 py-2 rounded-full hover:bg-blue-600 transition duration-300">Save</button>
				</div>

				<div class="text-center mt-4">
					<a href="profile.jsp">
						<button class="bg-gray-300 text-black px-6 py-2 rounded-full hover:bg-gray-400 transition duration-300">Back to Profile</button>
					</a>
				</div>

			</form>
		</div>
	</div>

</body>
</html>
