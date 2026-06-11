export default function Home() {
  return (
    <div className="min-h-screen bg-gradient-to-b from-primary-50 to-white">
      <header className="bg-white shadow">
        <nav className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <h1 className="text-2xl font-bold text-primary-700">École Cheikh Djibril Gaye</h1>
        </nav>
      </header>

      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="text-center">
          <h2 className="text-4xl font-bold text-gray-900 mb-4">
            Bienvenue à l'École Cheikh Djibril Gaye
          </h2>
          <p className="text-xl text-gray-600 mb-8">
            Plateforme numérique de gestion scolaire
          </p>
          <a
            href="/login"
            className="inline-block bg-primary-600 hover:bg-primary-700 text-white font-bold py-3 px-6 rounded-lg transition"
          >
            Se connecter
          </a>
        </div>
      </main>
    </div>
  );
}
