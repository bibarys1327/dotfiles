import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  console.log("🌱 Seeding database...");

  // --- Пример: создание пользователей ---
  const user1 = await prisma.user.upsert({
    where: { email: "alice@example.com" },
    update: {},
    create: {
      email: "alice@example.com",
      name: "Alice",
    },
  });

  const user2 = await prisma.user.upsert({
    where: { email: "bob@example.com" },
    update: {},
    create: {
      email: "bob@example.com",
      name: "Bob",
    },
  });

  // --- Пример: создание постов ---
  await prisma.post.createMany({
    data: [
      {
        title: "Hello World",
        content: "This is my first post seeded with Prisma!",
        authorId: user1.id,
      },
      {
        title: "Second Post",
        content: "Seeding makes life easier 🚀",
        authorId: user2.id,
      },
    ],
    skipDuplicates: true,
  });

  console.log("✅ Seeding complete!");
}

main()
  .catch((e) => {
    console.error("❌ Error while seeding:", e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
