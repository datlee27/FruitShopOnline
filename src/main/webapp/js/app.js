  document.getElementById("openLoginModal").addEventListener("click", function (e) {
        e.preventDefault();
        document.getElementById("loginModal").style.display = "flex";
    });

    document.getElementById("closeLoginModal").addEventListener("click", function () {
        document.getElementById("loginModal").style.display = "none";
    });

    document.getElementById("eye").addEventListener("click", function () {
        const passInput = document.getElementById("passwordField");
        const icon = this.querySelector("i");
        if (passInput.type === "password") {
            passInput.type = "text";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
        } else {
            passInput.type = "password";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
        }
    });
    
    
    function openAddModal() {
        document.getElementById("addProductModal").style.display = "flex";
    }

    function closeAddModal() {
        document.getElementById("addProductModal").style.display = "none";
    }

    // Tắt modal khi click bên ngoài form
    window.onclick = function(event) {
        var modal = document.getElementById("addProductModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };