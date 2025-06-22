import axios from 'axios';

const API_URL = 'http://localhost:5000/api'; // Adjust the port as necessary

// Function to handle user login
export const loginUser = async (credentials) => {
    try {
        const response = await axios.post(`${API_URL}/auth/login`, credentials);
        return response.data;
    } catch (error) {
        throw error.response.data;
    }
};

// Function to submit a shift handover
export const submitHandover = async (handoverData) => {
    try {
        const response = await axios.post(`${API_URL}/handover`, handoverData);
        return response.data;
    } catch (error) {
        throw error.response.data;
    }
};

// Function to fetch incidents
export const fetchIncidents = async () => {
    try {
        const response = await axios.get(`${API_URL}/incidents`);
        return response.data;
    } catch (error) {
        throw error.response.data;
    }
};

// Function to fetch user details
export const fetchUserDetails = async (userId) => {
    try {
        const response = await axios.get(`${API_URL}/users/${userId}`);
        return response.data;
    } catch (error) {
        throw error.response.data;
    }
};