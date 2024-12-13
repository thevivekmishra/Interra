<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
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
<nav class="bg-gradient-to-r from-cyan-500 to-blue-500 p-4">
		<div class="container mx-auto flex justify-between items-center">

			<a href=""
				class="text-white text-2xl font-bold hover:text-indigo-200"> <span
				class="text-yellow-400">Interra</span>IT
			</a>


			<div
				class="space-x-4 bg-gray-500 p-1 rounded-sm hover:bg-gray-600 px-2">
				<a href="login.jsp" class="text-white hover:text-indigo-200">Login</a>
			</div>

		</div>
	</nav>
    <div class="container mx-auto p-4">
        <div class="max-w-md mx-auto bg-white p-8 border shadow-md rounded-lg">
            <h2 class="text-2xl font-semibold mb-6 text-center">Create an Account</h2>

            <form action="RegisterServlet" method="POST">
                <div class="mb-4">
                    <label for="name" class="block text-sm font-medium text-gray-700">Full Name</label>
                    <input type="text" id="name" name="name" required placeholder="Enter your name"
                        class="mt-1 p-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                </div>

                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
                    <input type="email" id="email" name="email" required placeholder="Enter your email"
                        class="mt-1 p-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                </div>

                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" id="password" name="password" required placeholder="Enter your password"
                        class="mt-1 p-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                </div>

                <div class="mb-4">
                    <label for="address" class="block text-sm font-medium text-gray-700">Address</label>
                    <textarea id="address" name="address" placeholder="Enter your address"
                        class="mt-1 p-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500"></textarea>
                </div>

                <div class="mb-4">
                    <label for="mobile" class="block text-sm font-medium text-gray-700">Mobile Number</label>
                    <input type="text" id="mobile" name="mobile" required placeholder="Enter your mobile number"
                        class="mt-1 p-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                </div>

                <div class="mb-4">
                    <label for="doj" class="block text-sm font-medium text-gray-700">Date of Joining (DOJ)</label>
                    <input type="date" id="doj" name="doj" required
                        class="mt-1 p-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                </div>

                <div class="mb-4">
                    <label class="block text-sm font-medium text-gray-700">Gender</label>
                    <div class="flex items-center">
                        <input type="radio" id="gender_male" name="gender" value="Male" required
                            class="mr-2">
                        <label for="gender_male" class="text-sm text-gray-700">Male</label>

                        <input type="radio" id="gender_female" name="gender" value="Female" required
                            class="ml-4 mr-2">
                        <label for="gender_female" class="text-sm text-gray-700">Female</label>

                      
                    </div>
                </div>

                <div class="mb-4">
                    <button type="submit"
                        class="w-full p-2 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700">Register</button>
                </div>

                <div class="text-center text-sm">
                    <p>Already have an account? <a href="login.jsp" class="text-blue-600 hover:text-blue-800">Login here</a></p>
                </div>
            </form>
        </div>
    </div>

</body>

</html>
