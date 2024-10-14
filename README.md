<body>

<h1>E-NexGadget</h1>
<p><strong>E-NexGadget</strong> is a fully-featured ecommerce platform developed using Laravel 10. It provides a seamless shopping experience with two distinct panels for administrators and customers. The platform is designed to sell electronic gadgets, with functionalities ranging from product browsing to order management. The project incorporates a user-friendly interface, Ajax-based interactions, and image processing.</p>

<h2>Features</h2>

<h3>Admin Panel</h3>
<ul>
    <li><strong>Dashboard:</strong> Overview of orders, sales, and activities.</li>
    <li><strong>Category Management:</strong> Create, edit, and delete categories.</li>
    <li><strong>Subcategory Management:</strong> Manage subcategories under each category.</li>
    <li><strong>Brand Management:</strong> Create and manage product brands.</li>
    <li><strong>Product Management:</strong> Add, edit, and manage products.</li>
    <li><strong>Product Ratings:</strong> View and manage customer product ratings.</li>
    <li><strong>Shipping Management:</strong> Set shipping options and charges.</li>
    <li><strong>Order Management:</strong> View and update customer orders.</li>
    <li><strong>Discount Management:</strong> Create and manage discount coupons.</li>
    <li><strong>User Management:</strong> Manage customer accounts and their details.</li>
    <li><strong>Page Management:</strong> Manage static pages like About Us, Contact, etc.</li>
</ul>

<h3>Customer Panel</h3>

<h4>Home Page</h4>
<ul>
    <li>View all categories with their subcategories.</li>
    <li>Display of categories along with the total number of products in each.</li>
    <li>Browse the latest and featured products.</li>
</ul>

<h4>Shop Page</h4>
<ul>
    <li>Product filtering by:
        <ul>
            <li>Latest products.</li>
            <li>Price (high to low, low to high).</li>
            <li>Category, Subcategory, Brand.</li>
            <li>Price ranges.</li>
        </ul>
    </li>
</ul>

<h4>Checkout Page</h4>
<ul>
    <li>Manage shipping address.</li>
    <li>View order summary.</li>
    <li>Apply discount coupons.</li>
    <li>Select payment method (COD only).</li>
    <li>Receive order confirmation via email (integrated with Mailtrap).</li>
</ul>

<h4>Other Customer Features</h4>
<ul>
    <li><strong>Cart Page:</strong> Add, remove, and manage products in the cart.</li>
    <li><strong>Wishlist:</strong> Save and manage favorite products.</li>
    <li><strong>My Orders:</strong> View and track order history.</li>
    <li><strong>Change Password:</strong> Secure password management.</li>
    <li><strong>Forgot Password:</strong> Password recovery via email (integrated with Mailtrap).</li>
</ul>

<h2>Technology Stack</h2>
<ul>
    <li><strong>Framework:</strong> Laravel 10</li>
    <li><strong>Frontend:</strong> Bootstrap</li>
    <li><strong>AJAX:</strong> Used for dynamic and responsive interactions.</li>
    <li><strong>Image Processing:</strong> Handled using <a href="https://image.intervention.io/">Intervention/Image</a>.</li>
    <li><strong>Mailing:</strong> Implemented using <a href="https://mailtrap.io/">Mailtrap</a> for testing email functionality.</li>
</ul>

<h2>Installation</h2>
<ol>
    <li>Clone the repository:
        <pre><code>git clone https://github.com/akbarsami22/E-NexGadget.git</code></pre>
    </li>
    <li>Navigate to the project directory:
        <pre><code>cd E-NexGadget</code></pre>
    </li>
    <li>Install dependencies:
        <pre><code>composer install</code></pre>
    </li>
    <li>Set up environment variables by copying <code>.env.example</code> to <code>.env</code> and updating the necessary database credentials and Mailtrap configuration:
        <pre><code>cp .env.example .env</code></pre>
    </li>
    <li>Generate the application key:
        <pre><code>php artisan key:generate</code></pre>
    </li>
    <li>You have two options for setting up the database:
        <ul>
            <li><strong>Option 1:</strong> Import the provided SQL file (<code>e-nexgadget.sql</code>) into your database.</li>
            <li><strong>Option 2:</strong> Run the migrations to create the tables:
                <pre><code>php artisan migrate --seed</code></pre>
            </li>
        </ul>
    </li>
    <li>Serve the application locally:
        <pre><code>php artisan serve</code></pre>
    </li>
</ol>

<h2>Create Admin User</h2>
<p><strong>Note:</strong> Skip this step if you import the SQL file. Only follow these instructions if you create the database yourself and migrate the tables.</p>
<p>To create an admin user, run the following commands in the terminal:</p>
<pre><code>php artisan tinker
$admin = new User();
$admin->name = 'admin';
$admin->email = 'admin@gmail.com';
$admin->password = Hash::make('admin');
$admin->role = 2;
$admin->save();
</code></pre>


<h2>Usage</h2>
<p>Once the application is set up, you can access the following panels:</p>
<ul>
    <li><strong>Admin Panel:</strong> <code>http://localhost/admin</code></li>
    <li><strong>Customer Panel (Home Page):</strong> <code>http://localhost</code></li>
</ul>

<h3>Credentials</h3>
<ul>
    <li><strong>Admin Login:</strong>
        <ul>
            <li>Email: <code>admin@gmail.com</code></li>
            <li>Password: <code>admin</code></li>
        </ul>
    </li>
    <li><strong>Customer Login:</strong>
        <ul>
            <li>Register a new account</li>
        </ul>
    </li>
</ul>

<h2>Contributing</h2>
<p>Feel free to fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.</p>

<h2>License</h2>
<p>This project is open-source and available under the <a href="LICENSE">MIT License</a>.</p>

</body>
