import { configureStore } from '@reduxjs/toolkit';

const store = configureStore(
    {
        reducer: {
            // Define a top-level state field named `example`, handled by `exampleReducer`
            example: () => "Hello World"
        }
    }
);
export { store };