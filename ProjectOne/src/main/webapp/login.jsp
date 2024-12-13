<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
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
				<a href="registration.jsp" class="text-white hover:text-indigo-200">Register</a>
			</div>

		</div>
	</nav>

<div class="container mx-auto p-4 mt-24">
        <div class="max-w-md mx-auto bg-white p-8 border shadow-md rounded-lg">
            <h2 class="text-2xl font-semibold mb-6 text-center">Login to Your Account</h2>

            <form action="LoginServlet" method="POST">
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-700">Email Address</label>
                    <input type="email" id="email" name="email" required placeholder="Enter your email"
                        class="mt-1 p-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                </div>

                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" id="password" name="password" required placeholder="***********"
                        class="mt-1 p-2 w-full border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-indigo-500">
                </div>

                <div class="mb-4">
                    <button type="submit"
                        class="w-full p-2 bg-blue-600 text-white font-semibold rounded-md hover:bg-blue-700">Login</button>
                </div>

                <div class="text-center text-sm">
                    <p>Don't have an account? <a href="registration.jsp" class="text-blue-600 hover:text-blue-800">Sign up here</a></p>
                </div>

            </form>
        </div>
    </div>

</body>

</html>
