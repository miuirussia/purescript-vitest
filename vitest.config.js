import { defineConfig } from 'vitest/config';
import react from '@vitejs/plugin-react';

import path from 'path';

export default defineConfig({
  resolve: {
    alias: {
      'Test.Main': path.resolve(__dirname, 'output/Test.Main'),
    },
  },
  plugins: [
    react(),
  ],
  test: {
    clearMocks: true
  }
})
