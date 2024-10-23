<script setup>
import { ref, computed } from "vue";
import { defineAsyncComponent } from "vue";
import Home from "./pages/Home.vue";
import Test from "./pages/Test.vue";


const routes = {
  "/": Home,
  "/test": Test,

};

// Reactive variable for the current path
const currentPath = ref(window.location.pathname);

// Function to update currentPath on URL change
const updatePath = () => {
  currentPath.value = window.location.pathname;
};

// Listen for changes to the URL
window.addEventListener("popstate", updatePath);

// Compute the component to render based on the current path
const currentView = computed(() => {
  return routes[currentPath.value] || NotFound;
});
</script>

<template>
  <component :is="currentView" />
</template>
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Helvetica', sans-serif;
    border-radius: 1%;
}

.Cards{
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 75px;
    margin: 10px;
    padding: 50px;
  }

  
body{
    background-color: var(--background);    
}
main{
  min-height: 86dvh;
    max-height: fit-content;
    margin: 1%;
    padding: 2%;
    background-color: white;
    box-shadow: 0 .5rem 1rem rgba(0, 0, 0, .15);
}
.page {
    margin-top: 20px;
  }
  
  button:disabled {
    opacity: 0.5;
    cursor: not-allowed;
  }
  </style>