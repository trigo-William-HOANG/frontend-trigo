<template>
    <div class="searchbar">
      <form @submit.prevent="emitSearch" class="bar">
        <input 
          type="text" 
          v-model="query" 
          placeholder="Rechercher..." 
          class="search-input"
        />
        <button type="submit" class="search-button">
          <i class="bx bx-search"></i>
        </button>
      </form>
    </div>
  </template>
  
  <script setup>
  import { ref, watch, defineEmits } from 'vue';
  
  const query = ref('');
  const emit = defineEmits(['update:search']);
  
  const emitSearch = () => {
    emit('update:search', query.value);
  };
  
  // Met à jour en temps réel la recherche
  watch(query, (newQuery) => {
    emit('update:search', newQuery);
  });
  </script>
  
  <style scoped>
  .searchbar {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 10px;
  }
  
  .bar {
    display: flex;
    align-items: center;
    background-color: #ffffff;
    border-radius: 20px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    width: 300px;
  }
  
  .search-input {
    flex: 1;
    padding: 10px;
    border: none;
    outline: none;
    font-size: 1em;
    border-radius: 20px 0 0 20px;
  }
  
  .search-button {
    background-color: white;
    border: none;
    color: rgb(224, 224, 224);
    padding: 10px 15px;
    cursor: pointer;
    transition: background 0.3s;
    border-radius: 0 20px 20px 0;
  }
  </style>
  